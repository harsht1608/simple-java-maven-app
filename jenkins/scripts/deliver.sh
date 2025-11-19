#!/usr/bin/env bash
set -e

echo "Running Maven Install..."
mvn -B -DskipTests clean package

echo "Evaluating project name..."
NAME=$(mvn -q -DforceStdout help:evaluate -Dexpression=project.name)

echo "Evaluating project version..."
VERSION=$(mvn -q -DforceStdout help:evaluate -Dexpression=project.version)

echo "Running Application..."
java -jar target/${NAME}-${VERSION}.jar
