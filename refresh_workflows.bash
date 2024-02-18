#! /bin/bash

templateFile='workflow_templates/simple_crate_build.yml'

toBuild=(
	### 'repoOwner/repoName' EXAMPLE: 'sharkdp/bat'
	'anordal/shellharden'
	'whitfin/runiq'
	'nabijaczleweli/cargo-update'
	'riey/cargo-feature'
)
for crate in "${toBuild[@]}"; do
	# REPO=toBuild[crate] # May eventually need to switch to using indexed arrays of arrays, or something more complicated than this simple Bash script...
	buildGoal="${crate##*/}"
	sed -e "s!@@TARGET_ARTIFACT@@!$buildGoal!g" -e "s!@@CRATE_REPO@@!$crate!g" "$templateFile" > ".github/workflows/build_${buildGoal//-/_}.yml"
done