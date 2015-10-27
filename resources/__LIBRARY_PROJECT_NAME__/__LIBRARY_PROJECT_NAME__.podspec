Pod::Spec.new do |s|
  s.name             = "__LIBRARY_PROJECT_NAME__"
  s.version          = "0.1.0"
  s.summary          = "__LIBRARY_PROJECT_NAME__"
  s.homepage         = "https://github.com/soundcloud/SoundCloud-RAC"
  s.author           = { "Slavko" => "slavko@soundcloud.com" }

  s.platform = :ios, '7.0'
  s.requires_arc = true

  s.default_subspec = 'Classes'
  s.subspec 'Classes' do |classes|
    classes.source_files = ['__LIBRARY_PROJECT_NAME__/Pod/Classes/**/*.{h,m}','__LIBRARY_PROJECT_NAME__/Pod/__LIBRARY_PROJECT_NAME__.h' ]

    classes.dependency 'ReactiveCocoa'
  end
end
