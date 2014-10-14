# Overview
OpenAM provides a service called access management, which involves managing access to resources available over the network. Once you set up OpenAM to manage access, you have a centralized service to take control of who can access what resources, when, and under what conditions. In this chapter you manage access to a single web page. Yet, a resource can be just about anything accessible over the network from a web page, to an application, to a web service.

OpenAM centralizes access control by handling both authentication and also authorization. Authentication is confirming an identity, for example confirming that a user has successfully logged in. Authorization is determining whether to grant access to someone who has authenticated.

OpenAM centralizes authentication by using a variety of authentication modules. Authentication modules connect to identity repositories that store identities and provide authentication services. The identity repositories can be implemented as LDAP directories, relational databases, RADIUS, Windows authentication, one-time password services, other standards-based access management systems and much more. OpenAM lets you chain together the authentication services used. Authentication chains let you configure stronger authentication for more sensitive resources for example. They also let you set up modules that remember a device when the user logs in successfully. Or that evaluate the risk given the login circumstances and therefore can require more credentials when a user is logging in from an unusual location. This chapter uses OpenAM's built-in identity repository and authentication modules to make it easier to get started.

OpenAM centralizes authorization by letting you use OpenAM to manage access policies separate from applications and resources. Instead of building access policy into a web application, you install a policy agent with the web application to request policy decisions from OpenAM. This way you can avoid issues that could arise when developers must embed policy decisions into their applications. With OpenAM, if policy changes or an issue is found after the application is deployed, you have only to change the policy definition in OpenAM, not deploy a new version of the application. OpenAM makes the authorization decisions, and policy agents enforce the decisions on OpenAM's behalf.

The rest of this chapter has you demonstrate OpenAM access management by installing OpenAM, creating a policy, and installing a policy agent on a web server to enforce the policy for a web page.

# Usage

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
FORGEROCK OPEN IDENTITY STACK DEVELOPMENT LICENSE
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
This license applies to this copy of ForgeRock's Open Identity Stack software,
which includes OpenAM, OpenIDM and OpenDJ software, when used for development
or testing purposes.  To obtain a license to use the Open Identity Stack under
conditions other than for testing or development purposes please contact
ForgeRock at sales@forgerock.com.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
If you intend to or do use the ForgeRock Product only for the purposes of
developing, testing, prototyping and/or demonstrating your application, then
ForgeRock grants you a nonexclusive, nontransferable, limited license to use
the ForgeRock Product only for those purposes, and not for any other purpose.
In such case, the ForgeRock product is made available to you AS IS and without
warranty of any kind. ForgeRock may audit your use of the ForgeRock Product for
compliance with these terms and confirmation that a commercial or production
license is not required.

If you intend to or do use the application you develop for any commercial,
production or other purpose not permitted by the previous paragraph, you must
enter into a ForgeRock Software License and Subscription Agreement, pay the
associated Fees, and comply with all terms and conditions of that Agreement.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

## Charm Contact

For detailed instructions and configuration optins, goto: http://docs.forgerock.org/en/openam/latest/getting-started/index.html

For any problems and bug discovered, goto: http://bugster.forgerock.org.

