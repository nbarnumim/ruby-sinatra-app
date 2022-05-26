# frozen_string_literal: true

require "./app"

require "prometheus/middleware/collector"

use Prometheus::Middleware::Collector

run Sinatra::Application
