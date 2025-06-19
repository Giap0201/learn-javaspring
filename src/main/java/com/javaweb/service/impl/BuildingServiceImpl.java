package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.model.BuildingResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.entity.BuildingEntity;
import com.javaweb.service.BuildingService;

@Service
public class BuildingServiceImpl implements BuildingService {
	// dung autowired de tu dong khoi tao
	@Autowired
	private BuildingRepository buildingRepository;

	@Override
	public List<BuildingResponseDTO> getAll() {
		List<BuildingResponseDTO> result = new ArrayList<BuildingResponseDTO>();
		List<BuildingEntity> buildingEntities = buildingRepository.getAll();
		for(BuildingEntity item : buildingEntities) {
			BuildingResponseDTO building = new BuildingResponseDTO();
			building.setName(item.getName());
			building.setAddress(item.getStreet() + " , " + item.getWard());
			result.add(building);
		}
		return result;
	}

//	@Override
//	public List<BuildingDTO> getAll() {
//		List<BuildingEntity> allBuilding = buildingRepository.getAll();
//		List<BuildingDTO> results = new ArrayList<BuildingDTO>();
//		for (BuildingEntity item : allBuilding) {
//			BuildingDTO buildingDTO = new BuildingDTO();
//			buildingDTO.setName(item.getName());
//			buildingDTO.setNumberOfBasement(item.getNumberOfBasement());
//			buildingDTO.setAddress(item.getStreet() + " " + item.getWard());
//			results.add(buildingDTO);
//		}
//		return results;
//	}
	
	
}
