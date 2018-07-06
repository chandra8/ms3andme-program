package com.ms3.java.coding;

import java.io.Serializable;

public class RangeObject implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5063923525240719214L;

	private int min;
	
	private int max;

	/**
	 * @return the min
	 */
	public int getMin() {
		return min;
	}

	/**
	 * @param min the min to set
	 */
	public void setMin(int min) {
		this.min = min;
	}

	/**
	 * @return the max
	 */
	public int getMax() {
		return max;
	}

	/**
	 * @param max the max to set
	 */
	public void setMax(int max) {
		this.max = max;
	}
	
	
}
