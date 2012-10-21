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
- XML

In the following, only the JSON format is used to describe the API further.

API description
---------------

_TODO_

Author
------
Sebastian Schumann (seb.schumann@gmail.com)
2012
