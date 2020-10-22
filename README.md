# Terraform Json Schema Input Validation Example

This example project provides a way to do Terraform module input validation using standard `Json Schema` validation. 

##Motivation 
The motivation for doing this is that the recently released Terraform .13 variable 
[validation rules](https://www.terraform.io/docs/configuration/variables.html#custom-validation-rules) provides a non-standard
method of validating inputs with the following drawbacks!
 
 * Poorly documented with limited examples.
 * Validation rules for Complex Types (List, Maps, Objects) is not possible or results in obscure rules.
 * Violates DRY. Logic in rules is not reusable across variables, modules and projects. 
 * Error messages don't support interpolations. Results in ambiguous errors with Complex Types (List, Maps, Objects).
 
 
##Why Json Schema?

[Json Schema](https://json-schema.org/) is a widely adopted standard with significant existing tooling in multiple languages.
It provides a more general purpose and expressive way of validation that addresses all the concerns in the 
[Motivation](#motivation) section and provides the following benefits.

 * Published Schema can be used by other upstream applications (UI, CI/CD ...) or teams.
 * Can be used to generate code or documentation.
 * [IDE integration](#ide-integration) such as Intellij provides validation and IntelliSense.
 * More expressive validation.
   

<pre style="line-height: 100%;font-family:monospace;background-color:#2b2b2b; border-width:0.01mm; border-color:#000000; border-style:solid;padding:4px;font-size:13pt;"><span style="color:#606366;background-color:#313335;">1 </span><span style="color:#a9b7c6;background-color:#2b2b2b;">resource </span><span style="color:#6a8759;background-color:#2b2b2b;">"aws_s3_bucket"</span><span style="color:#a9b7c6;background-color:#2b2b2b;"> </span><span style="color:#6a8759;background-color:#2b2b2b;">"bucket"</span><span style="color:#a9b7c6;background-color:#2b2b2b;"> {
</span><span style="color:#606366;background-color:#313335;">2 </span><span style="color:#a9b7c6;background-color:#2b2b2b;">  bucket = var.s3_bucket.name
</span><span style="color:#606366;background-color:#313335;">3 </span><span style="color:#a9b7c6;background-color:#2b2b2b;">  tags = var.required_tags
</span><span style="color:#606366;background-color:#313335;">4 </span><span style="color:#a9b7c6;background-color:#2b2b2b;">}</span></pre>
##IDE Integration
