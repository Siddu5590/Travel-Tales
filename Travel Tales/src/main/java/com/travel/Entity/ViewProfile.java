package com.travel.Entity;

public class ViewProfile {
private String CustomerID;
private String Name;
private String Phone;
private String Email;
public String getCustomerID() {
	return CustomerID;
}
public void setCustomerID(String customerID) {
	CustomerID = customerID;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getPhone() {
	return Phone;
}
public void setPhone(String phone) {
	Phone = phone;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
@Override
public String toString() {
	return "ViewProfile [CustomerID=" + CustomerID + ", Name=" + Name + ", Phone=" + Phone + ", Email=" + Email + "]";
}



}
