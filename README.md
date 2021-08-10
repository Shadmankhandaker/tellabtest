# TELLab - The Experiential Learning LABoratory for experimental psychology
The **tellab2** repository contains the code for the new-and-improved TELLab.

## Organization

The running system consists of four primary subsystems:

1. the [_page server_](#page-server), which
delivers the initial content to the browser on page load, reloads,
browser back button, etc.

2. the [_API server_](#api-server), which feeds data to the
client javascript running in the browser, through AJAX requests;

3. the [_upload server_](#upload-server), which loads and serves user-created files.

4. the [_database server_](#database-server), which interfaces with the API server.

In the original TELLab, the first three functions were combined in
a single express server, and the database ran on the same machine.
Splitting the functions onto different machines should improve performance,
and allows simplification and modularization of the code.
It is not clear which functions will be most heavily stressed as
usage increases, but my guess is that the API server will be the first that
will require multiple instances and load-balancing.

The servers can be run locally for testing.  Cloud-based instances
are run on the TACC Jetstream platform, part of the XSEDE
computing infrastructure.


The original TELLab server communicated via the HTTP protocol, which is
inherently insecure, as an eavesdropper could capture clear-text passwords
transmitted to the server, and other personal data.  Tellab2 provides
secure HTTPS encrypted communication with the servers.  Use of HTTPS
requires certificates and keys for encryption; for the cloud-based servers,
these are provided by [LetsEncrypt](#letsencrypt), a free service.  For local testing,
self-signed certificates are generated using the [openssl](#openssl) program.

To make things easy for users, an [HTTP redirect server](#redirect-server)
is provided to redirect HTTP requests to the secure HTTPS server.
Similarly, a [reverse-proxy server](#reverse-proxy-server) is needed to
forward secure HTTPS requests to the upload server (which is implemented
for HTTP only).
## TELLab servers

<a name="page-server"></a>
### The page server

The page server is a NodeJS process using the express framework.
It is designed as a single-page app, with almost all of the processing
performed by client-side javascript running in the user's browser.
This approach has the disadvantage of the possibility of problems due
to incompatible browsers, but offers many performance advantages and
reduces demand on the server.


<a name="api-server"></a>
### The API server

The API server provides the Application Programming Interface (API).
Like the page server, the API server is a NodeJS express server.
Client-side javascript provided to the user's browser by the page server
communicates with the API server via AJAX requests.
The API server is mostly stateless, but provides the user with a session
cookie after authentication.

<a name="upload-server"></a>
### The upload server

User uploads are implemented using the Tus protocol; the upload server
is an instance of tusd.  The tusd program only supports insecure HTTP;
a [reverse proxy server](#reverse-proxy-server) is implemented to translate secure HTTPS requests from the
client to HTTPS for the server.

<a name="database-server"></a>
### The database server

TELLab is implemented using the MongoDB database; the database server
is an instance of mongod.  The API server interacts with the server
via the mongodb and connect-mongo modules.  Administrators can interact
directly with the database using the mongo shell command line interface (CLI).
A set of scripts written in the mongo shell are provided to perform
common administrative tasks.  The long-term goal is that it should be
possible to perform all administrative tasks from within TELLab's web-based
administrative interface, but during development it is crucial to be able
to interact directly with the database to inspect the results of operations
and delete invalid records as necessary.

<a name="redirect-server"></a>
### The HTTP redirect server

The function of this server is to redirect requests to http://lab2.tellab.org
to the secure site at https://lab2.tellab.org.  This is implemented with a
simple NodeJS server.

<a name="reverse-proxy-server"></a>
### The tusd reverse proxy server

The [tusd program](https://github.com/tus/tusd)
is implemented to respond only to HTTP 
requests, to avoid complications.
A reverse proxy server is implemented as a simple NodeJS server
using the [http-proxy module](https://github.com/http-party/node-http-proxy).
The initial implementation of this did not work properly with the
[Uppy package](https://uppy.io/)
until the xfwd:true option was added to the server creation call.

### The HTTP redirect server

The function of this server is to redirect requests to http://lab2.tellab.org
to the secure site at https://lab2.tellab.org.  This is implemented with a
simple NodeJS server.  The code can be found in [pageServer/redirect_http.js](https://github.com/jbmulligan/tellab2/blob/master/pageServer/redirect_http.js).

## HTTPS implementation

<a name="letsencrypt"></a>
## LetsEncrypt

LetsEncrypt certificates are issued for a 90 day period.
They are supposed to renew automatically, but currently that
feature does not work on the page server, because

<a name="openssl"></a>
## Generating self-signed certificates with openssl

## Simple git cheat sheet

### Create a new branch

[This tutorial](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) has useful information about how to manage branches.
In summary:

1.  Create a new branch (named "my-new-branch") and switch to it:

git checkout -b my-new-branch

2.  Do work, commits go to the new branch.

3.  Work complete; merge branch with master

git checkout master
git merge my-new-branch

4.  Delete the branch

NOTE:  always check out the branch that you want to merge TO (not from) !!!

The tutorial contains more material about when you have multiple issues
going on at the same time...

