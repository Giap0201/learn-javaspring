package com.javaweb.service;

import java.util.List;

import com.javaweb.model.BuildingDTO;
import com.javaweb.model.BuildingResponseDTO;

public interface BuildingService {
	List<BuildingResponseDTO> getAll();
}
