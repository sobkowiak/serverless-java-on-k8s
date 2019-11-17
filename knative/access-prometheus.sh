kubectl port-forward -n knative-monitoring \
	$(kubectl get pods -n knative-monitoring \
	--selector=app=prometheus --output=jsonpath="{.items[0].metadata.name}") \
	9090

# "http://localhost:9090/"
# container_memory_rss{namespace="knativetutorial", container_name="user-container"}
# sum(container_memory_rss{namespace="knativetutorial"}) by (pod_name)