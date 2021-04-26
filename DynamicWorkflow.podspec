Pod::Spec.new do |s|
  s.name             = 'DynamicWorkflow'
  s.version          = '1.0.22'
  s.summary          = 'Workflows that work, yo (blame Richard for this name)'
  s.description      = <<-DESC
iOS has a linear paradigm for navigation that doesn't support a lot of flexibility. This library attempts to create a dynamic way to define your workflows in code allowing for easy reording.
                       DESC

  s.homepage         = 'https://github.com/Tyler-Keith-Thompson/Workflow'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'Tyler.Thompson' => 'Tyler.Thompson@wwt.com' }
  s.source           = { :git => 'https://github.com/Tyler-Keith-Thompson/Workflow.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.1'

  s.source_files = 'Workflow/**/*.{swift,h,m}'

  s.subspec 'Swinject' do |ss|
    ss.source_files = ['Workflow/**/*.{swift,h,m}', 'DependencyInjection/**/*.{swift,h}']
    ss.dependency 'Swinject'
  end

end
