package com.alexrezv.ecommerce.config;

import com.alexrezv.ecommerce.entity.Product;
import com.alexrezv.ecommerce.entity.ProductCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.Type;

@Configuration
public class DataRestConfiguration implements RepositoryRestConfigurer {

    private final EntityManager entityManager;

    @Autowired
    public DataRestConfiguration(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config, CorsRegistry cors) {
        HttpMethod[] restricted = {HttpMethod.PUT, HttpMethod.POST, HttpMethod.DELETE};

        config.getExposureConfiguration()
                .forDomainType(Product.class)
                .withItemExposure((metadata, httpMethods) -> httpMethods.disable(restricted))
                .withCollectionExposure((metadata, httpMethods) -> httpMethods.disable(restricted));
        config.getExposureConfiguration()
                .forDomainType(ProductCategory.class)
                .withItemExposure((metadata, httpMethods) -> httpMethods.disable(restricted))
                .withCollectionExposure((metadata, httpMethods) -> httpMethods.disable(restricted));

        exposeIds(config);
    }

    private void exposeIds(RepositoryRestConfiguration config) {
        var entityTypes = entityManager.getMetamodel().getEntities();
        var entityClasses = entityTypes.stream().map(Type::getJavaType).toArray(Class[]::new);
        config.exposeIdsFor(entityClasses);
    }

}
