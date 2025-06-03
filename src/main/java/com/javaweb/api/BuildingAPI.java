package com.javaweb.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.model.BuildingDTO;
import com.javaweb.service.BuildingService;

@RestController
public class BuildingAPI {
	// @RequestMapping(value = "/api/building/", method = RequestMethod.GET)
	// public void getBuilding(@RequestParam(value = "name", required = false)
	// String name,
	// @RequestParam(value = "numberOfBasement", required = false) String
	// numberOfbasement) {
	// System.out.println(name);
	// System.out.println(numberOfbasement);
	// }

	// lam theo kieu khac
	// @GetMapping(value = "/api/building/")
	// public void getBuilding(@RequestParam Map<String, Object> pargam) {
	// System.out.println("ok");
	// }

	// @RequestMapping(value = "/api/building/", method = RequestMethod.POST)
	// public void getBuilding1(@RequestBody BuildingDTO buildingDTO) {
	// System.out.println("ok");
	// }

	// @GetMapping(value = "/api/building/")
	// public List<BuildingDTO> listBuildingDTOs(@RequestParam(value = "name",
	// required = false) String name,
	// @RequestParam(value = "numberOfBasement", required = false) String
	// numberOfBasement,
	// @RequestParam(value = "ward", required = false) String ward) {
	// List<BuildingDTO> listBuildingDTO = new ArrayList<>();

	// // xu li xong duoi db roi
	// BuildingDTO buildingDTO1 = new BuildingDTO();
	// buildingDTO1.setName("Nguyen Huu Giap");
	// buildingDTO1.setNumberOfBasement("10");
	// buildingDTO1.setStreet("Dong Da");

	// BuildingDTO buildingDTO2 = new BuildingDTO();
	// buildingDTO2.setName("Nguyen Van A");
	// buildingDTO2.setNumberOfBasement("1");
	// buildingDTO2.setStreet("Linh Nam");

	// listBuildingDTO.add(buildingDTO1);
	// listBuildingDTO.add(buildingDTO2);
	// return listBuildingDTO;
	// }

//	@GetMapping(value = "/api/building/")
//	public Object getBuidling(@RequestParam Map<Object,Object> pargam){
//		BuildingDTO buildingDTO = new BuildingDTO();
//
//		//xu li xong het roi
//		try {
//			System.out.println(5/0);
//		} catch (Exception e) {
//			ErrorResponseDTO errorResponseDTO = new ErrorResponseDTO();
//			errorResponseDTO.setError(e.getMessage());
//			List<String> detailErrors = new ArrayList<>();
//			detailErrors.add("Loi so nguyen khong the chia cho 0");
//			errorResponseDTO.setDetailErrors(detailErrors);
//			return errorResponseDTO;
//		}
//		buildingDTO.setName("Hello World");
//		buildingDTO.setNumberOfBasement("20");
//		buildingDTO.setStreet("Chan");
//		return buildingDTO;
//	}
//
//	//chua su dung controllerAdvice
//	@PostMapping(value = "/api/building/")
//	public Object getBuilding(@RequestBody BuildingDTO buildingDTO){
//
//		try {
//			validate(buildingDTO);
//		} catch (FieldRequiredException e) {
//			ErrorResponseDTO errorResponseDTO = new ErrorResponseDTO();
//			errorResponseDTO.setError(e.getMessage());
//			List<String> errorDetails = new ArrayList<>();
//			errorDetails.add("Ten va so tang khong duoc null");
//			errorResponseDTO.setDetailErrors(errorDetails);
//			return errorResponseDTO;
//		}
//		BuildingDTO building = new BuildingDTO();
//		building.setName("Hello");
//		building.setNumberOfBasement("10");
//		building.setWard("Dong Da");
//		return building;
//	}
//
//	//su dung controllerAdvice de xu li phan loi, tra ve dung httpstatus code
//	@PostMapping(value = "/api/buildings/")
//	public Object getBuildings(@RequestBody BuildingDTO buildingDTO){
//		System.out.println(5/0);
//		validate(buildingDTO);
//		BuildingDTO building = new BuildingDTO();
//		building.setName("Nguyen Huu Giap");
//		building.setNumberOfBasement("10");
//		building.setWard("Khong Vui");
//		return building;
//	}
	@Autowired
	private BuildingService buildingService;

	@PostMapping(value = "/api/building/")
	public List<BuildingDTO> getAllBuilding(@RequestBody BuildingDTO buildingDTO) {
		List<BuildingDTO> result = buildingService.getAll();
		return result;
	}

//	public void validate(BuildingDTO buildingDTO) {
//		if(buildingDTO.getName() == null || buildingDTO.getName().equals("") || buildingDTO.getNumberOfBasement() == null){
//			throw new FieldRequiredException("name and numberOfBasement is null");
//		}
//	}

	// PathValueble thuong dung lam chuc nang xoa
	@GetMapping(value = "/api/building/{id}/{name}")
	public void deleteBuilding(@PathVariable String id, @PathVariable String name,
			@RequestParam(value = "ward", required = false) String ward) {
		System.out.println("OK");
	}

	// test loi chia cho 0
	// @PostMapping(value = "/api/buildings/")
	// public Object gObject(@RequestParam Map<Object,Object> pargam){
	// System.out.println(5/0);
	// return null;
	// }

}
