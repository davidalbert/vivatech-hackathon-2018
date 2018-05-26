package dbd.hackaton.mymechanic.spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import dbd.hackaton.mymechanic.spring.domain.Garage;

public interface OvsEventRepository extends 
	JpaRepository<Garage, Long>, JpaSpecificationExecutor<Garage> {

	
}
