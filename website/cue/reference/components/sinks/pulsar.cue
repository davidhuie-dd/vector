package metadata

components: sinks: pulsar: {
	title: "Apache Pulsar"

	classes: {
		commonly_used: false
		delivery:      "at_least_once"
		development:   "beta"
		egress_method: "stream"
		service_providers: []
		stateful: false
	}

	features: {
		acknowledgements: false
		healthcheck: enabled: true
		send: {
			compression: {
				enabled: false
			}
			encoding: {
				enabled: false
			}
			request: enabled: false
			tls: enabled:     false
			to: {
				service: services.pulsar

				interface: {
					socket: {
						api: {
							title: "Pulsar protocol"
							url:   urls.pulsar_protocol
						}
						direction: "outgoing"
						protocols: ["http"]
						ssl: "disabled"
					}
				}
			}
		}
	}

	support: {
		requirements: []
		warnings: []
		notices: []
	}

	configuration: base.components.sinks.pulsar.configuration

	input: {
		logs:    true
		metrics: null
		traces:  false
	}

	telemetry: metrics: {
		component_discarded_events_total: components.sources.internal_metrics.output.metrics.component_discarded_events_total
		component_errors_total:           components.sources.internal_metrics.output.metrics.component_errors_total
		encode_errors_total:              components.sources.internal_metrics.output.metrics.encode_errors_total
	}
}
