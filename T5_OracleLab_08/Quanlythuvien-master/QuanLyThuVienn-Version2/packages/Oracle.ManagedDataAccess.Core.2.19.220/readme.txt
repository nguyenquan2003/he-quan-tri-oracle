Oracle.ManagedDataAccess.Core NuGet Package 2.19.220 README
===========================================================
Release Notes: Oracle Data Provider for .NET Core

December 2023

This provider supports .NET 6 & .NET 7.

This document provides information that supplements the Oracle Data Provider for .NET (ODP.NET) documentation.

You have downloaded Oracle Data Provider for .NET. The license agreement is available here:
https://www.oracle.com/downloads/licenses/distribution-license.html


Bug Fixes since Oracle.ManagedDataAccess.Core NuGet Package 2.19.210
====================================================================
Bug 35852518 - ONE-WAY TLS ENCOUNTERS "ORACLE COMMUNICATION: FAILED TO CONNECT TO SERVER OR FAILED TO PARSE CONNECT STRING"
Bug 35985984 - BULKCOPY CORRUPTS INSERTED DATA WHEN COLUMN DATA EXCEEDS COLUMN DEFINED LENGTH
Bug 35999664 - NULLREFERENCEEXCEPTION WHEN CREATING LOT OF CONNECTIONS IN PARALLEL WITH DIFFERENT PROXY USERS 


Known Issues and Limitations
============================
1) BindToDirectory throws NullReferenceException on Linux when LdapConnection AuthType is Anonymous

https://github.com/dotnet/runtime/issues/61683

This issue is observed when using System.DirectoryServices.Protocols, version 6.0.0.
To workaround the issue, use System.DirectoryServices.Protocols, version 5.0.1.

 Copyright (c) 2021, 2023, Oracle and/or its affiliates. 
