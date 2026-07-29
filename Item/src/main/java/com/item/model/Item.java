package com.item.model;

public class Item {

    private Long id;
    private String name;
    private double price;
    private int totalNumber;

    // Default Constructor
    public Item() {
    }

    // Constructor without id
    public Item(String name, double price, int totalNumber) {
        this.name = name;
        this.price = price;
        this.totalNumber = totalNumber;
    }

    // Constructor with id
    public Item(Long id, String name, double price, int totalNumber) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.totalNumber = totalNumber;
    }

    // Getter and Setter for id
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for price
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // Getter and Setter for totalNumber
    public int getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }
}