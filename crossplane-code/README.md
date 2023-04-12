# Intro

## About Crossplane

Crossplane is a framework for building cloud native control planes without needing to write code. It has a highly extensible backend that enables you to build a control plane that can orchestrate applications and infrastructure no matter where they run, and a highly configurable frontend that puts you in control of the schema of the declarative API it offers.

## Kubernetes setup

For this tutotial we will use [Kind](https://kind.sigs.k8s.io/)

I already provide a file to spin up your cluster locally

```kind create cluster --config kind-cluster.yaml```
