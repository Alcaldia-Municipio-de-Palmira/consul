class SDGManagement::LocalTargets::FormComponent < ApplicationComponent
  delegate :back_link_to, to: :helpers
  include SDGManagement::Header
  include TranslatableFormHelper
  include GlobalizeHelper

  attr_reader :local_target

  def initialize(local_target)
    @local_target = local_target
  end

  private

    def title
      t("sdg_management.local_targets.new.title")
    end

    def form_url
      if local_target.persisted?
        sdg_management_local_target_path(local_target)
      else
        sdg_management_local_targets_path
      end
    end

    def target_options
      options_for_select(SDG::Target.all.sort.map { |target| [target.code, target.id] })
    end
end
