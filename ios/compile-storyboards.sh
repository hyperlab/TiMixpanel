#!/bin/bash
echo "Staring..."
platform_dir=$(pwd)/platform/iphone
cd $platform_dir
for storyboard_file in *.storyboard; do
	if [ -f $storyboard_file ]; then
		basename=$(basename "$storyboard_file")
		echo "	$basename found, staring compilation..."
		tmp="/tmp/$basename.$RANDOM.storyboardc"
		ibtool --target-device iphone --target-device ipad --errors --warnings --notices --module se.hyperlab.mixpanel --minimum-deployment-target 6.0 --auto-activate-custom-fonts --output-format human-readable-text --compile "${tmp}" "${storyboard_file}"
		if [ -f "${storyboard_file}c" ]; then
			rm -fr "${storyboard_file}c"
		fi
		mv $tmp "$platform_dir/${basename}c"
	fi
done
echo "Done"