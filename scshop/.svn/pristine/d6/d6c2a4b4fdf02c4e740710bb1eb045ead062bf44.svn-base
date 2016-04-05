package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.wudianyi.wb.scshop.action.BaseAction;

@Entity
@Table(name = "scshop_agent")
public class Agent implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String name;

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
