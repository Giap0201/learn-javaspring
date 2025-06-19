package com.javaweb.model;

import java.util.List;

public class BuildingSearchDTO {
	private String name; // ten toa nha
	private String floorArea; // dien tich san
	private String ward;
	private String street;
	private String numberOfBasement; // so tang ham
	private String direction; // huong
	private String lever; // hang
	private Integer rentAreaFrom; // Diem tich tu
	private Integer rentAreaTo; // Dien tich den
	private Integer rentPriceFrom; // Gia thue tu
	private Integer rentPriceTo; // gia thue den
	private String managerName; // Ten quan li
	private String managerPhoneNumber; // Dien thoai quan li
	private Long districId; // Quan hien co
	private Long staffId; // Nhan vien phu trach
	private List<Integer> buildingTypes;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFloorArea() {
		return floorArea;
	}

	public void setFloorArea(String floorArea) {
		this.floorArea = floorArea;
	}

	public String getWard() {
		return ward;
	}

	public void setWard(String ward) {
		this.ward = ward;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getNumberOfBasement() {
		return numberOfBasement;
	}

	public void setNumberOfBasement(String numberOfBasement) {
		this.numberOfBasement = numberOfBasement;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getLever() {
		return lever;
	}

	public void setLever(String lever) {
		this.lever = lever;
	}

	public Integer getRentAreaFrom() {
		return rentAreaFrom;
	}

	public void setRentAreaFrom(Integer rentAreaFrom) {
		this.rentAreaFrom = rentAreaFrom;
	}

	public Integer getRentAreaTo() {
		return rentAreaTo;
	}

	public void setRentAreaTo(Integer rentAreaTo) {
		this.rentAreaTo = rentAreaTo;
	}

	public Integer getRentPriceFrom() {
		return rentPriceFrom;
	}

	public void setRentPriceFrom(Integer rentPriceFrom) {
		this.rentPriceFrom = rentPriceFrom;
	}

	public Integer getRentPriceTo() {
		return rentPriceTo;
	}

	public void setRentPriceTo(Integer rentPriceTo) {
		this.rentPriceTo = rentPriceTo;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerPhoneNumber() {
		return managerPhoneNumber;
	}

	public void setManagerPhoneNumber(String managerPhoneNumber) {
		this.managerPhoneNumber = managerPhoneNumber;
	}

	public Long getDistricId() {
		return districId;
	}

	public void setDistricId(Long districId) {
		this.districId = districId;
	}

	public Long getStaffId() {
		return staffId;
	}

	public void setStaffId(Long staffId) {
		this.staffId = staffId;
	}

	public List<Integer> getBuildingTypes() {
		return buildingTypes;
	}

	public void setBuildingTypes(List<Integer> buildingTypes) {
		this.buildingTypes = buildingTypes;
	}

}
