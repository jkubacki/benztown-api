# frozen_string_literal: true

require "rails_helper"

RSpec.describe Element do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :file }

  describe "file attachment" do
    context "when file attachment is not in allowed content types" do
      subject { build_stubbed(:element, :with_wav_file) }

      it "returns invalid type error" do
        expect(subject).not_to be_valid
        expect(subject.errors[:file]).to eq ["is not a valid file format"]
      end
    end

    context "when file attachment is in allowed content types" do
      subject { build_stubbed(:element, :with_mp3_file) }

      it { is_expected.to be_valid }
    end
  end
end
