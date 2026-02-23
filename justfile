preset_name := "Web"
build_dir := "./build"

@_default: clean build deploy

build:
    mkdir -p {{ build_dir }}
    godot --headless --export-release {{ preset_name }} {{ build_dir }}/index.html

clean:
    rm -rf {{ build_dir }}

deploy:
    docker compose down
    docker compose up -d
