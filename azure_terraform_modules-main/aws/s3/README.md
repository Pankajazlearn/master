# S3 Module
Usage: 
This module is used to create s3 bucket with some features:
- logging enabled
- https transport enabled.
- versioning
- lifecycle rules
- server-side encryption

**Parameters:**

Parameter Name | Description | Type | Default |
--- | --- | --- | --- |
bucket | This is the human-readable name of the bucket.  | string  | no default - Follow convention "s3-dev-euw1-001" |
acl | The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write. | string |  |
force_destroy |  A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. | boolean | false |
acceleration_status | Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended. | string | null| 
versioning |  A state of versioning| map(string) |  | 
logging | A settings of bucket logging| map(string) |  | 
lifecycle_rule | A configuration of object lifecycle management| map(string) |  | 
replication_configuration | A configuration of replication configuration| map(string) |  | 
server_side_encryption_configuration | A configuration of server-side encryption configuration | map(string) |  | 
restrict_access_vpce | used as boolean to retrict access to specific VPC Endpoints | boolean | false | 
allowed_vpc_endpoints | a set of the VPC endpoints that will be allowed in case "restrict_access_vpce" is true | set of string | [] | 
object_ownership | Object ownership. Valid values: BucketOwnerPreferred or ObjectWriter. 'BucketOwnerPreferred': Objects uploaded to the bucket change ownership to the bucket owner if the objects are uploaded with the bucket-owner-full-control canned ACL. 'ObjectWriter': The uploading account will own the object if the object is uploaded with the bucket-owner-full-control canned ACL. | string | ObjectWriter | 
project | Provide the project name code of the Business Unit under which the resources are provisioned | string |  | 
environment | Provide the environment name under the resources are provisioned| string | | 
business_unit | The business unit in which the resources are provisioned| string |  | 
owner | The owner of the resources are provisioned | string |  | 
operational_company | Provide the Operational Company name under which the resources are provisioned | string |  | 

**Examples** <br/>
- for Replication example: see this documentation to understand setup https://docs.aws.amazon.com/AmazonS3/latest/userguide/replication-walkthrough1.html
- there is another example for s3 bucket and logging s3 bucket.

**OPA Policies:** <br />
OPA policies are in https://github.com/GS-MAFTech/iac-pac in aws-pac/ folder . 

**Validate OPA policies:** <br />
terraform plan -out plan1 <br />
terraform show -json plan1 > plan1.json <br />
opa eval  --format pretty  -d opa/aws/ --input plan1.json "data.terraform.deny" <br />

**OPA validation scripts:** <br />
- enforce_s3_bucket_encryption.rego: Makes sure that the server side encryption is enabled.
- enforce_s3_bucket_logging.rego: Makes sure that logging is enabled for the bucket. if the description of the bucket includes "s3_access_log" then logging will not be checked for this bucket as this is a logging bucket.
- enforce_s3_bucket_private.rego: Makes sure that the acl for the bucket is not public.
- enforce_s3_bucket_tag.rego: Makes sure that confidentiality tag is added to the bucket.
