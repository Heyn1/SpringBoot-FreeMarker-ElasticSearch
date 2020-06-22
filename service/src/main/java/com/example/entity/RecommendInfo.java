package com.example.entity;

import lombok.Data;

@Data
public class RecommendInfo {

  private String requireName;
  private String comapnyName;
  private String time;
  private String money;


  public String getRequireName() {
    return requireName;
  }

  public void setRequireName(String requireName) {
    this.requireName = requireName;
  }


  public String getComapnyName() {
    return comapnyName;
  }

  public void setComapnyName(String comapnyName) {
    this.comapnyName = comapnyName;
  }


  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }


  public String getMoney() {
    return money;
  }

  public void setMoney(String money) {
    this.money = money;
  }

}
