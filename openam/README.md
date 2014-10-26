# Overview

##About ForgeRock Open Identity Stack
ForgeRock is pioneering open source identity management through innovation, simplification, and openness for all identity services. Dedicated to democratizing Identity Management for everyone across enterprise, social, mobile, and the cloud, ForgeRock products support mission-critical operations with a fully open source platform. 

[ForgeRock’s Open Identity Stack](http://forgerock.com/products/) powers solutions for thousands of the world’s largest companies and government organizations.

Our goal is simple: to deliver the best open source identity stack for securing anything, anywhere, on any device.

The Open Identity Stack includes the following main products:

- OpenAM is a single, unified access management solution providing authentication, authorization, federation, web services security, fine-grained entitlements, and adaptive authorization all in one self-contained Java application. Included with OpenAM, the Open Identity Gateway (OpenIG) is a high-performance gateway with specialized session management and credential replay functionality. 

- OpenDJ is an LDAP directory server — the first-ever directory natively supporting REST — with a flexible access model that lets developers choose between REST, SCIM, LDAP or web services. The 100% Java-based LDAPv3-compliant server is extremely efficient with minimal CPU, memory and on-disk footprint. 

- OpenIDM is the only 100% open source, lightweight, user administration and provisioning solution purpose-built for Internet scale. It’s easy to embed and deploy, with a small footprint and out-of-the-box REST interfaces that use standard Java development tools. OpenIDM uses the Open Identity Connectors Framework and Toolkit (OpenICF) to aid development of resource connectors. 

##ForgeRock OpenAM

ForgeRock OpenAM was designed in response to a milieu of access management suites that were pieced together through acquisitions, creating an accidental architecture that complicates deployment and passes integration costs on to customers. Based on the Sun OpenSSO codebase, OpenAM is an “All-In-One” access management platform for protecting any type of resource across enterprise, cloud, social, and mobile environments. What has traditionally been delivered by legacy identity vendors as six different products — SSO, adaptive authentication, strong authentication, federation, web services security, and ﬁne-grained entitlements — is delivered as a single, uniﬁed offering. Organizations can use the access control services they need and simply “turn on” additional services when ready.
 
The solution has an inherently unique architecture to support use cases from complex enterprise access control, to multi-protocol federation, to enabling SSO for cloud systems. At the highest level OpenAM consists in a single, self-contained Java application; service components such as session management; client side APIs in C, Java, REST; service provider interfaces to enable custom plugins; and policy agents for web and app server containers to enforce access policies to protected web sites and web applications. Organizations with existing internal access management solutions can easily integrate OpenAM into their environment through API services or through the token translation service. Maintaining all installation and conﬁguration capabilities within one application vastly simpliﬁes deployment. In addition, agent conﬁguration, server conﬁguration, and other tasks are simpliﬁed to be repeatable and scalable, so multiple instances of the solution can be deployed without additional effort. The embedded OpenDJ directory server eliminates the need to conﬁgure a separate directory to support the conﬁguration and data stores, or if desired, users can utilize other LDAP directories or databases.

**Key OpenAM Features**

- Authentication
With over 20 out-of-the-box authentication methods supported, OpenAM has the flexibility to chain methods together along with Adaptive Risk scoring, or to create custom authentication modules based on the JAAS (Java Authentication and Authorization Service) open standard. Windows IWA is supported to enable a completely seamless heterogeneous OS and Web application SSO environment.
 
- Authorization
OpenAM provides authorization policy from basic, simple, coarse-grained rules to highly advanced, fine-grained entitlements based on XACML (Extensible Authorization Mark-Up Language). With the ability to abstract authorization policy away from the application, developers can quickly add or change policy as needed without modification to the underlying application.
 
- Adaptive Risk Authentication 
The adaptive risk authentication module is used to assess risks during the authentication process, to determine whether to require that the user complete further authentication steps. Adaptive risk authentication determines, based on risk scoring, whether more information from a user is required when they login. For example, a risk score can be calculated based on an IP address range, access from a new device, account idle time, etc., and applied to the authentication chain.
 
- Federation 
Federation services securely share identity information across heterogeneous systems or domain boundaries using standard identity protocols (SAML, WS-Fed, OpenID Connect). Quickly setup and configure service provider or cloud service connections through the Fedlet, OAUTH2 Client, OAUTH2 Provider, or OpenIG Federation Gateway. Unique to OpenAM, the OpenIG Federation Gateway provides a SAML2 compliant enforcement point to and allows businesses to quickly add SAML2 support to their applications with little to no knowledge of the standard.

- Single Sign-On: OpenAM provides multiple mechanisms for SSO, whether the requirement is enabling cross-domain SSO for a single organization, or SSO across multiple organizations through the Federation Service. OpenAM supports multiple options for enforcing policy and protecting resources, including policy agents that reside on web or application servers, a proxy server, or the OpenIG (Identity Gateway). OpenIG runs as a self-contained gateway and protects web applications where installing a policy agent is not possible.
 
- High Availability & Session Failover
To enable high availability for large-scale and mission-critical deployments, OpenAM provides both system failover and session failover. These two key features help to ensure that no single point of failure exists in the deployment, and that the OpenAM service is always available to end-users. Redundant OpenAM servers, policy agents, and load balancers prevent a single point of failure. Session failover ensures the user’s session continues uninterrupted, and no user data is lost. The high availability of OpenAM is based upon using a load balancing (either software or hardware based) which supports sticky sessions to distribute the load across all available OpenAM server. Should one server become unavailable, the load balancer fails client requests over to another OpenAM server. The other OpenAM server must then fail over the user session associated with the client.
The session persistence repository is based on the bundled OpenDJ LDAP server. Recommended setup would be to have a external configuration of the OpenDJ as the session store which can scale and be redundant independent of the number of instances of OpenAM.

##Futher documentation 

Can be found available online here:
- [Documentation home](http://docs.forgerock.org)
- [Release note](http://docs.forgerock.org/en/openam/latest/release-notes/index/index.html)
- [Installation guide](http://docs.forgerock.org/en/openam/latest/install-guide/index/index.html)
- [Administration guide](http://docs.forgerock.org/en/openam/latest/admin-guide/index/index.html)

##Subscription

ForgeRock can offer a subscription for those who want to use ForgeRock products for production.
Check out here: [Subscriptions](http://forgerock.com/products/subscriptions/).

# Usage

To be able to install OpenAM you have to accept the license term as outlined in the license file.
You can either accept the license terms on the commmand line or by the checkbox in the Juju-gui.

In addition you have to set a "private" admin password for your deployment, either on the command or in th Juju-gui.

Step by step instructions on using the charm:

    juju deploy openam --constraints="mem=4G arch=amd64"
	juju set openam accept_license='true' amadmin_password='cangetin'

The instance running OpenAM needs at least 4GB RAM.

This relase of the OpenAM charm supports a Juju relationship to ForgeRock OpenDJ. OpenDJ is a LDAP directory server which in most cases are used as user repositories. OpenDJ comes with some sample users which can be added to the default authentication chain in OpenAM to test and verify how easy such a integration can be done. You can verify the users in the OpenAM web console in the following location both with and without a relationship:

- 'Access Control' -> '/ (Top Level Realm)' -> 'Subjects'

The datastore itself is created in 

- 'Access Control' -> '/ (Top Level Realm)' -> 'Data stores'

and named 'opendj'.

Many more relationships for both datastores and authentication services will be added in the future. Any contribution are welcome.

## Scale out Usage

OpenAM itself is highly scalable using built-in a site configuration option and can be used behind load balancers. This release of OpenAM do support it, but the autoscaling features supported by Juju is not currently mapped a OpenAM site configurations.

## Known Limitations and Issues

This release of OpenAM is meant for evaluation purposes only and will violate the license terms if used in a production environment. There is no limitation in features of the product.

Other limitations of this charm
- Autoscaling is not supported in this charm release
- Only OpenDJ is tested as a user repository for authenticate users
- Only the Apache OpenAM Agent relastionship is currently supported. Currently no support for the .Net and J2EE.
- Only OpenID Connect is supported as a automatically way of authenticate users of any charm implementing the same interface 

There will be more features and relationships to come.
# Configuration

In addition to the license agreement and the admin password you can change or set the following configuration options.

OpenAM uses the default Tomcat7 as it's java container for deployment. Default ports are 8080 and for SSL 8443 is used. There is a self-signed certificate created for SSL.

-  http_port, defaults to 8080
-  https_port, defaults to 8443
-  java_opts, defaults to '-Xmx1024m -XX:MaxPermSize=256m'

You can then browse to http://ip-address:8080 or https://ip-address:8443 to further configure OpenAM. Default admin user is "amadmin" and password is the one defined on deployment.

# Contact Information

Stein Myrseth <stein.myrseth@forgerock.com>

## ForgeRock
- [ForgeRock Homepage](http://forgerock.com)
- [ForgeRock Community](http://forgerock.org)
