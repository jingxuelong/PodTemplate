module Pod

  class ConfigureSwift
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      keep_demo = configurator.ask_with_answers("Would you like to include a demo application with your library", ["Yes", "No"]).to_sym

      framework = configurator.ask_with_answers("Which testing frameworks will you use", ["Quick", "None"]).to_sym
      case framework
        when :quick
          configurator.add_pod_to_podfile "Quick', '~> 2.2.0"
          configurator.add_pod_to_podfile "Nimble', '~> 8.0.7"
          configurator.set_test_framework "quick", "swift", "swift"

        when :none
          configurator.set_test_framework "xctest", "swift", "swift"
      end

      snapshots = configurator.ask_with_answers("Would you like to do view based testing", ["Yes", "No"]).to_sym
      case snapshots
        when :yes
          configurator.add_pod_to_podfile "FBSnapshotTestCase' , '~> 2.1.4"

          if keep_demo == :no
              puts " Putting demo application back in, you cannot do view tests without a host application."
              keep_demo = :yes
          end

          if framework == :quick
              configurator.add_pod_to_podfile "Nimble-Snapshots' , '~> 8.0.0"
          end
      end

      # template_file = configurator.ask_with_answers("是否创建模板文件", [ "None", "Service", "Business"]).to_sym
      # case template_file
      #   when :Service
      #     pod_name = @configurator.pod_name
      #     # `touch Pod/Classes/API/#{pod_name}API.swift`
      #     # `touch Pod/Classes/Model/#{pod_name}Model.swift`
      #     # `touch Pod/Classes/Service/#{pod_name}Service.swift`

      #     configurator.add_pod_to_podfile "
      #     s.subspec \'API\' do |ss|
      #       ss.source_files = [\"${pod_name}/Classes/API/**/*\"]
      #     end
      #     "

      #     configurator.add_pod_to_podfile "
      #     s.subspec \'Model\' do |ss|
      #       ss.source_files = [\"${pod_name}/Classes/Model/**/*\"]
      #     end
      #     "

      #     configurator.add_pod_to_podfile "
      #     s.subspec \'Service\' do |ss|
      #       ss.source_files = [\"${pod_name}/Classes/Service/**/*\"]
      #       ss.dependency 'AFNetworking', '~> 2.3'
      #     end
      #     "

      #   when :Business
      #     pod_name = @configurator.pod_name
      #     `mv Business/* Pod/Classes`
      #     `touch Pod/Classes/ViewController/#{pod_name}ViewController.swift`
      #     `touch Pod/Classes/Router/#{pod_name}Router.swift`
      #     `touch Pod/Classes/ViewModel/#{pod_name}ViewModel.swift`
      #     `touch Pod/Classes/View/#{pod_name}View.swift`
      #     `touch Pod/Classes/SectionController/#{pod_name}SectionController.swift`
      #     `touch Pod/Classes/Section/#{pod_name}Section.swift`

      # end

      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => (keep_demo == :no),
        :prefix => ""
      }).run

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      `touch Pod/Classes/ReplaceMe.swift`

      `mv ./templates/swift/* ./`

      # remove podspec for osx
      `rm ./NAME-osx.podspec`
    end
  end

end
