# Tata Supply Chain Management System

## Overview
This project implements a Supply Chain Management Database System for Tata Supply Chain Co. Ltd. The system is designed to manage procurement, inventory, vendor relationships, material receiving, quality inspection, and material issuance activities using a relational database.

The database streamlines day-to-day operations by maintaining accurate records of parts, suppliers, purchase orders, goods receipts, inspections, and production material requests.

---

## Features

- Part and inventory management
- Vendor and supplier management
- Purchase order processing
- Challan and Goods Received Report (GRR) tracking
- Quality inspection and rejection monitoring
- Material Issue Requisition (MIR) management
- Referential integrity through foreign keys
- Data validation using constraints and triggers
- Business logic implementation using stored procedures and functions

---

## Database Design

The database follows normalization principles to reduce redundancy and maintain data consistency.

### Core Modules

- Inventory Management
- Vendor Management
- Procurement Management
- Goods Receiving
- Quality Control
- Production Material Issue

### Main Tables

- PartCategory
- Part
- Vendor
- PaymentTerm
- VendorPart
- Transporter
- PurchaseOrder
- PurchaseOrderDetail
- Challan
- ChallanDetail
- GRR
- GRRDetail
- QualityInspection
- MIR
- MIRDetail

---

## SQL Concepts Implemented

### Database Design
- Primary Keys
- Foreign Keys
- Unique Constraints
- Check Constraints
- Normalization (up to 3NF)

### Database Programming
- Stored Procedures
- Stored Functions
- Triggers

### Querying
- Joins
- Aggregate Functions
- GROUP BY
- Subqueries
- Data Validation Queries

---

## Business Rules Implemented

- One vendor can supply multiple parts.
- One part can be supplied by multiple vendors.
- Duplicate part entries within a transaction are prevented.
- Quality inspection quantities are validated.
- Material issue quantities must be positive.
- Purchase order and inspection statuses are standardized.
- Referential integrity is enforced across all modules.

---

## Project Files

- TataSupplyChain.sql – Database schema, constraints, procedures, functions, triggers, and sample data.
- ER_Diagram.pdf – Entity Relationship Diagram.
- Database_Structure.xlsx – Table structures and database documentation.
- README.md – Project documentation.

---

## Technologies Used

- MySQL
- SQL (DDL, DML, DCL)
- MySQL Workbench

---

## Outcome

The project provides a structured and scalable database solution for managing procurement, inventory control, material receiving, quality inspection, and production material issuance within a supply chain environment.
