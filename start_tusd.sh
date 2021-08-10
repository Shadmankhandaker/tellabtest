#!/bin/bash

tusd_prog=uploadServer/tusd/tusd

if [ ! -e $tusd_prog ]; then
	echo $tusd_prog not found.
	exit
fi

# possible options:
# -port <portnum>  (default=1080)

echo Will start tusd with default options.

$tusd_prog -behind-proxy 2> tusd_errors.log 1> tusd_output.log &

echo " "
echo " "

# now start the proxy too
./start_tusd_proxy.sh

exit

# output of tusd --help:

Usage of uploadServer/tusd/tusd:
  -base-path string
    	Basepath of the HTTP server (default "/files/")
  -behind-proxy
    	Respect X-Forwarded-* and similar headers which may be set by proxies
  -expose-metrics
    	Expose metrics about tusd usage (default true)
  -gcs-bucket string
    	Use Google Cloud Storage with this bucket as storage backend (requires the GCS_SERVICE_ACCOUNT_FILE environment variable to be set)
  -gcs-object-prefix string
    	Prefix for GCS object names (can't contain underscore character)
  -hooks-dir string
    	Directory to search for available hooks scripts
  -hooks-enabled-events string
    	Comma separated list of enabled hook events (e.g. post-create,post-finish). Leave empty to enable all events
  -hooks-grpc string
    	An gRPC endpoint to which hook events will be sent to
  -hooks-grpc-backoff int
    	Number of seconds to wait before retrying each retry (default 1)
  -hooks-grpc-retry int
    	Number of times to retry on a server error or network timeout (default 3)
  -hooks-http string
    	An HTTP endpoint to which hook events will be sent to
  -hooks-http-backoff int
    	Number of seconds to wait before retrying each retry (default 1)
  -hooks-http-retry int
    	Number of times to retry on a 500 or network timeout (default 3)
  -hooks-plugin string
    	Path to a Go plugin for loading hook functions (only supported on Linux and macOS; highly EXPERIMENTAL and may BREAK in the future)
  -hooks-stop-code int
    	Return code from post-receive hook which causes tusd to stop and delete the current upload. A zero value means that no uploads will be stopped
  -host string
    	Host to bind HTTP server to (default "0.0.0.0")
  -max-size int
    	Maximum size of a single upload in bytes
  -metrics-path string
    	Path under which the metrics endpoint will be accessible (default "/metrics")
  -port string
    	Port to bind HTTP server to (default "1080")
  -s3-bucket string
    	Use AWS S3 with this bucket as storage backend (requires the AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_REGION environment variables to be set)
  -s3-endpoint string
    	Endpoint to use S3 compatible implementations like minio (requires s3-bucket to be pass)
  -s3-object-prefix string
    	Prefix for S3 object names
  -timeout int
    	Read timeout for connections in milliseconds.  A zero value means that reads will not timeout (default 6000)
  -unix-sock string
    	If set, will listen to a UNIX socket at this location instead of a TCP socket
  -upload-dir string
    	Directory to store uploads in (default "./data")
  -verbose
    	Enable verbose logging output (default true)
  -version
    	Print tusd version information
