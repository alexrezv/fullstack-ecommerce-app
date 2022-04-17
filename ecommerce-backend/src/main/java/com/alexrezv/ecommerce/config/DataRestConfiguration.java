package com.alexrezv.ecommerce.config;

import com.alexrezv.ecommerce.entity.Country;
import com.alexrezv.ecommerce.entity.Product;
import com.alexrezv.ecommerce.entity.ProductCategory;
import com.alexrezv.ecommerce.entity.State;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.Type;
import java.util.List;

@Configuration
public class DataRestConfiguration implements RepositoryRestConfigurer {

    private final EntityManager entityManager;

    @Autowired
    public DataRestConfiguration(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config, CorsRegistry cors) {
        HttpMethod[] restrictedMethods = {HttpMethod.PUT, HttpMethod.POST, HttpMethod.PATCH, HttpMethod.DELETE};

        List.of(Product.class, ProductCategory.class, Country.class, State.class)
                .forEach(entity -> restrictAccess(config, restrictedMethods, entity));

        exposeIds(config);
    }

    void restrictAccess(RepositoryRestConfiguration config, HttpMethod[] restrictedMethods, Class<?> entity) {
        config.getExposureConfiguration()
                .forDomainType(entity)
                .withItemExposure((metadata, httpMethods) -> httpMethods.disable(restrictedMethods))
                .withCollectionExposure((metadata, httpMethods) -> httpMethods.disable(restrictedMethods));
    }

    private void exposeIds(RepositoryRestConfiguration config) {
        var entityTypes = entityManager.getMetamodel().getEntities();
        var entityClasses = entityTypes.stream().map(Type::getJavaType).toArray(Class[]::new);
        config.exposeIdsFor(entityClasses);
    }

}
