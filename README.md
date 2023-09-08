#Terraform
Website: https://www.terraform.io
Forums: HashiCorp Discuss
Documentation: https://www.terraform.io/docs/
Tutorials: HashiCorp's Learn Platform
Certification Exam: HashiCorp Certified: Terraform Associate
Terraform

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

The key features of Terraform are:

Infrastructure as Code: Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

Execution Plans: Terraform has a "planning" step where it generates an execution plan. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.

Resource Graph: Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources. Because of this, Terraform builds infrastructure as efficiently as possible, and operators get insight into dependencies in their infrastructure.

Change Automation: Complex changesets can be applied to your infrastructure with minimal human interaction. With the previously mentioned execution plan and resource graph, you know exactly what Terraform will change and in what order, avoiding many possible human errors.

For more information, refer to the What is Terraform? page on the Terraform website.

Getting Started & Documentation
Documentation is available on the Terraform website:

Introduction
Documentation
If you're new to Terraform and want to get started creating infrastructure, please check out our Getting Started guides on HashiCorp's learning platform. There are also additional guides to continue your learning.

Show off your Terraform knowledge by passing a certification exam. Visit the certification page for information about exams and find study materials on HashiCorp's learning platform.

Developing Terraform
This repository contains only Terraform core, which includes the command line interface and the main graph engine. Providers are implemented as plugins, and Terraform can automatically download providers that are published on the Terraform Registry. HashiCorp develops some providers, and others are developed by other organizations. For more information, see Extending Terraform.

To learn more about compiling Terraform and contributing suggested changes, refer to the contributing guide.

To learn more about how we handle bug reports, refer to the bug triage guide.

To learn how to contribute to the Terraform documentation in this repository, refer to the Terraform Documentation README.

License
Business Source License 1.1
