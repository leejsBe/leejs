package com.example.demo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@ToString
@Getter
@Setter
public @Data class Users{
	
	@Id
	@Column(name="id")
	private int ID;
	
	@Column(name="name")
	private String NAME;
	
	@Column(name="pwd")
	private String PWD;

	
}
