# Uncomment the next line to define a global platform for your project
platform :osx, '11.0'

ENV["PLATFORM"] = "mac"

inhibit_all_warnings!
install! "cocoapods",
#  :disable_input_output_paths => true,
  :generate_multiple_pod_projects => true,
  :warn_for_unused_master_specs_repo => false,
  :deterministic_uuids => false

target 'PAGQL' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PAGQL

end

target 'PAGQLExtension' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
#  pod 'libpag', :git => 'https://github.com/Tencent/libpag'#, :branch => 'alpha/4.0.5'
  pod 'libpag', :path => './libpag'
  # Pods for PAGQLExtension

end
