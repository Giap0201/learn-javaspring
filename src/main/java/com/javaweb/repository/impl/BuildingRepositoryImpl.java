package com.javaweb.repository.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.entity.BuildingEntity;

@Repository
public class BuildingRepositoryImpl implements BuildingRepository {
	static final String URL = "jdbc:mysql://localhost:3306/estatebasic";
	static final String USER = "root";
	static final String PASSWORD = "";

//	@Override
//	public List<BuildingEntity> getAll() {
//		String sql = "select * from building";
//		List<BuildingEntity> results = new ArrayList<BuildingEntity>();
//		try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
//				PreparedStatement ps = conn.prepareStatement(sql)) {
//			ResultSet rs = ps.executeQuery();
//			while (rs.next()) {
//				BuildingEntity buildingEntity = new BuildingEntity();
//				buildingEntity.setName(rs.getString("name"));
//				buildingEntity.setNumberOfBasement(rs.getInt("numberofbasement"));
//				buildingEntity.setStreet(rs.getString("street"));
//				buildingEntity.setWard(rs.getString("ward"));
//				results.add(buildingEntity);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return results;
//	}
//	@Override
//	public List<BuildingEntity> getAll(){
//		List<BuildingEntity> resultBuildings = new ArrayList<BuildingEntity>();
//		StringBuilder sql = new StringBuilder("select * from building where 1=1");
//		List<Object> pargam = new ArrayList<Object>();
//		if()
//		return resultBuildings;
//	}
	@Override
	public List<BuildingEntity> getAll(){
		List<BuildingEntity> resultBuildings = new ArrayList<BuildingEntity>();
		String query = "select * from building";
		try(Connection conn = DriverManager.getConnection(URL,USER,PASSWORD);
				PreparedStatement ps = conn.prepareStatement(query)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				BuildingEntity building = new BuildingEntity();
				building.setName(rs.getString("name"));
				building.setStreet(rs.getString("street"));
				building.setWard(rs.getString("ward"));
				resultBuildings.add(building);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return resultBuildings;
	}

}
