package com.alexrezv.ecommerce.dao;

import com.alexrezv.ecommerce.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

@Repository
@RepositoryRestResource(
        collectionResourceRel = "productCategory",
        path = "product-category")
public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Long> {
}
