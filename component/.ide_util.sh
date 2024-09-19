#!/usr/bin/env bash


# open pom.xml with Idea
function Idea() {
    project_name=$1
    open -a "$cusIdea" "$project_name"
}

# open project with webStorm
function WebStorm() {
    project_name=$1
    open -a "$cusWebStorm" "$project_name"
}
