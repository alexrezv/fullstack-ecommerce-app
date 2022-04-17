package com.alexrezv.ecommerce.dao;

import com.alexrezv.ecommerce.entity.State;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RepositoryRestResource
public interface StateRepository extends JpaRepository<State, Long> {

    List<State> findByCountryCode(@RequestParam("code") String code);

}
