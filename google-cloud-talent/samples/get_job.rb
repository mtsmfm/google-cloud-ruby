# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

def sample_get_job project_id, tenant_id, job_id
  # [START job_search_get_job]
  require "google/cloud/talent"

  # Instantiate a client
  job_service = Google::Cloud::Talent.job_service

  # project_id = "Your Google Cloud Project ID"
  # tenant_id = "Your Tenant ID (using tenancy is optional)"
  # job_id = "Job ID"
  formatted_name = job_service.job_path project: project_id,
                                        tenant:  tenant_id,
                                        job:     job_id

  response = job_service.get_job name: formatted_name
  puts "Job name: #{response.name}"
  puts "Requisition ID: #{response.requisition_id}"
  puts "Title: #{response.title}"
  puts "Description: #{response.description}"
  puts "Posting language: #{response.language_code}"
  response.addresses.each do |address|
    puts "Address: #{address}"
  end
  response.application_info.emails.each do |email|
    puts "Email: #{email}"
  end
  response.application_info.uris.each do |website_uri|
    puts "Website: #{website_uri}"
  end
  # [END job_search_get_job]
end

require "optparse"

if $PROGRAM_NAME == __FILE__

  project_id = "Your Google Cloud Project ID"
  tenant_id = "Your Tenant ID (using tenancy is optional)"
  job_id = "Job ID"

  ARGV.options do |opts|
    opts.on("--project_id=val") { |val| project_id = val }
    opts.on("--tenant_id=val") { |val| tenant_id = val }
    opts.on("--job_id=val") { |val| job_id = val }
    opts.parse!
  end


  sample_get_job project_id, tenant_id, job_id
end
