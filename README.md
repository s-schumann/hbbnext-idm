HBB-Next Identity Management (IdM) module
=========================================

Overview
--------
Identity Management module for the HBB-Next project.

Description
-----------
The IdM module offers management for **users**, **devices**, and their relation.

Relations are mapped between users and devices (*UDR*, i.e., user-device-relation). The relations include roles.

A third resource is the **context**. Contexts contain users and devices. To be flexible, a context is mapped to UDRs. The relation that keeps multiple UDRs within a context is called *CR*, i.e., context relation.

Whenever contexts are active, not the context attribute as such is changed, but only CRs. That way it is assured that users are only active on a device in **one context**.

Module interaction
------------------
The interaction with this module happens either through HTML or the API.

The API supports the following data representation formats:
- JSON
- *XML (not just yet)*

In the following, only the JSON format is used to describe the API further.

API description
---------------

- API with **C**reate **R**ead **U**pdate **D**elete support.
	- Create: HTTP POST
	- Read: HTTP GET
	- Update: HTTP PUT
	- Delete: HTTP DELETE

- API is versioned. Once a version has been made available, it is kept, and all future changes are made on an increased version number.

- For now, fields are submitted as key-value pairs x-www-form-urlencoded.
	- Key-value pairs separated by '=' and from each other by '&'
	- For now, each key is supplied including the model name (e.g. user[alias]=temp)

- The API required an API token for *all operations*. Each signed up user has a token.

Author
------
Sebastian Schumann (seb.schumann@gmail.com)
Slovak Telekom, 2012
