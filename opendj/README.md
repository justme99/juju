# Overview

##About ForgeRock Open Identity Stack
ForgeRock is pioneering open source identity management through innovation, simplification, and openness for all identity services. Dedicated to democratizing Identity Management for everyone across enterprise, social, mobile, and the cloud, ForgeRock products support mission-critical operations with a fully open source platform. 

[ForgeRock’s Open Identity Stack](http://forgerock.com/products/) powers solutions for thousands of the world’s largest companies and government organizations.

Our goal is simple: to deliver the best open source identity stack for securing anything, anywhere, on any device.

The Open Identity Stack includes the following main products:

- OpenAM is a single, unified access management solution providing authentication, authorization, federation, web services security, fine-grained entitlements, and adaptive authorization all in one self-contained Java application. Included with OpenAM, the Open Identity Gateway (OpenIG) is a high-performance gateway with specialized session management and credential replay functionality. 

- OpenDJ is an LDAP directory server — the first-ever directory natively supporting REST — with a flexible access model that lets developers choose between REST, SCIM, LDAP or web services. The 100% Java-based LDAPv3-compliant server is extremely efficient with minimal CPU, memory and on-disk footprint. 

- OpenIDM is the only 100% open source, lightweight, user administration and provisioning solution purpose-built for Internet scale. It’s easy to embed and deploy, with a small footprint and out-of-the-box REST interfaces that use standard Java development tools. OpenIDM uses the Open Identity Connectors Framework and Toolkit (OpenICF) to aid development of resource connectors. 

##ForgeRock OpenDJ

OpenDJ is an LDAPv3 and REST compliant directory service, developed for the Java platform, providing a high-performance, highly available, and secure store for the identities managed by your organization. Easy to install and configure, and combined with the utility of the Java platform, OpenDJ is the simplest, fastest directory to deploy and manage. Core to the management of identity information, OpenDJ directory services are used in many different use cases— whether it is for a large-scale cloud service directory, a consumer-facing directory, or an enterprise or network operating system (NOS) directory. With a 100% Java code base, OpenDJ runs on many platforms, including virtualized environments. All software and data are architecture-independent, so migration to a different OS or a different server is as simple as copying an instance to the new server. This increases the deployment flexibility, as well as the portability between different operating systems and system architectures.


**Key OpenDJ Features**

- Performance
OpenDJ is optimized for performance at scale with data integrity and security. With millisecond response times and read/write performance in the 10’s of thousands per second, OpenDJ satisfies the most rigorous performance requirements across industries from telecom and financial services to large-scale consumer-facing applications.
 
- Replication Services
By replicating data across multiple directory server instances, key user data is preserved in case of an outage. OpenDJ provides advanced replication options including multi-master, fractional, and assured. N-Way multi-master replication provides high-availability and disaster recovery capabilities. Fractional replication enables only specific attributes to be replicated and assured replication can be used to guarantee data availability even in the remote case of a server crash.
 
- Security
OpenDJ stores identity data securely, with varying levels of authentication and authorization, including SSL, StartTLS, and certificate-based. It protects passwords through encryption and advanced access control security policies. All configuration changes are audited and archived, offering easy rollback to a working configuration.
 
- Delegated Authentication
OpenDJ permits delegate authentication to another LDAP directory service, such as Active Directory, with a feature called pass-through authentication. The key benefit of pass-through authentication is to remove the security risks associated with synchronizing passwords (including possible capture and transfer of clear text passwords). With pass-through authentication, OpenDJ replays a user’s simple bind operation against the remote directory service. If the bind is successful, OpenDJ considers the user authenticated to perform subsequent operations like searches and updates in OpenDJ.
 
- Password Policy
OpenDJ password policies govern not only passwords, but also account lockout, and how OpenDJ provides notification about account status.
 
- Administration
The OpenDJ GUI-based installer and control panel simplifies installation and server configuration down to a few minutes. The command line utilities enable complete access to all server management controls and monitoring locally or remotely. OpenDJ also offers advanced backup and restore functions such as automated, compressed, signed, and encrypted backups that improve data reliability and security.
 
- Monitoring
By supporting the widely adopted monitoring standards SNMP and JMX, OpenDJ can easily integrate into your existing monitoring infrastructure. Configure custom alerts to inform administrators about specific directory service events such as password expiration, access controls disablement, backend database corruption detection, and much more.
 
- Developer Access
OpenDJ provides data access through multiple protocols: REST, LDAP, and Web Services. It fully complies with LDAPv3, DSMLv2, and SCIM standards to ensure maximum interoperability with client applications. The OpenDJ SDK provides a high-performance, easy-to-use library of classes and interfaces for accessing and implementing LDAP directory services.

##Futher documentation 

Can be found available online here:
- [Documentation home](http://docs.forgerock.org)
- [Release note](http://docs.forgerock.org/en/opendj/latest/release-notes/index/index.html)
- [Installation guide](http://docs.forgerock.org/en/opendj/latest/install-guide/index/index.html)
- [Administration guide](http://docs.forgerock.org/en/opendj/latest/admin-guide/index/index.html)

##Subscription

ForgeRock can offer a subscription for those who want to use ForgeRock products for production.
Check out here: [Subscriptions](http://forgerock.com/products/subscriptions/).

# Usage

To be able to install OpenAM you have to accept the license term as outlined in the license file.
You can either accept the license terms on the commmand line or by the checkboc in the Juju-gui.

In addition you have to set a "private" admin password for your deployment, either on the command or in th Juju-gui.

Step by step instructions on using the charm:

    juju deploy opendj
    juju set opendj accept_license='true' manager_password='secret'

This OpenDJ charm supports a relationship to OpenAM to be added as a user data store. The deployment of this OpenDJ charm includes some sample users, all users can be found in the subject listings in OpenAM after the relationship is establish in the web console at the following place. These sample OpenDJ users will be added after a successful relationship is established in the default authentication chain in OpenAM. You can verify the users in the OpenAM web console in the following location both with and without a relationship:

- 'Access Control' -> '/ (Top Level Realm)' -> 'Subjects'

The datastore itself is created in 

- 'Access Control' -> '/ (Top Level Realm)' -> 'Data stores'

and named 'opendj'.


Many more relationships for both datastores and authentication services will be added in the future. Any contribution are welcome.

## Scale out Usage

OpenDJ supports many different topologies for HA. This charm has support for a multimaster configuration setup, when adding more instances to a deployment. The current release of this charm need to test this feature some further.

## Known Limitations and Issues

This release of OpenDJ is meant for evaluation purposes only and will violate the license terms if used in a production environment. There is no limitation in features of the product.

Other limitations of this charm
- Autoscaling need to be improved

# Configuration

In addition to the license agreement and the 'Directory Manager' password you can change or set the following configuration options.

-  ldap_port, defaults to 389
-  base_dn, defaults to 'dc=example,dc=com'
-  rest_enabled, defaults to 'false'
-  rest_port, defaults to 8080
-  access_logging, defaults to 'false'

If 'rest_enabled' is turned on, the default port is set to 8080. The full documentation on the RESTful API support in OpenDJ is found online here: [OpenDJ - Performing RESTful Operations](http://docs.forgerock.org/en/opendj/latest/admin-guide/index/chap-rest-operations.html).

Yoou should then be able to bind to OpenDJ on default port 389 with any applications or a directory browser like ['Apache Directory Studio'](http://directory.apache.org/studio/) etc.


# Contact Information

Stein Myrseth <stein.myrseth@forgerock.com>

## ForgeRock
- [ForgeRock Homepage](http://forgerock.com)
- [ForgeRock Community](http://forgerock.org)
