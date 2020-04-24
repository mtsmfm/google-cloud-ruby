# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/automl/v1/geometry.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/automl/v1/geometry.proto", :syntax => :proto3) do
    add_message "google.cloud.automl.v1.NormalizedVertex" do
      optional :x, :float, 1
      optional :y, :float, 2
    end
    add_message "google.cloud.automl.v1.BoundingPoly" do
      repeated :normalized_vertices, :message, 2, "google.cloud.automl.v1.NormalizedVertex"
    end
  end
end

module Google
  module Cloud
    module AutoML
      module V1
        NormalizedVertex = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.NormalizedVertex").msgclass
        BoundingPoly = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.BoundingPoly").msgclass
      end
    end
  end
end