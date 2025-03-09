# TeX Live Development Container

This project provides a ready-to-use Docker environment optimized for LaTeX development with TeX Live. It integrates seamlessly with Visual Studio Code and ensures consistent formatting using `latexindent`.

## Features

- ✅ **Dockerized TeX Live environment** for reproducibility and portability
- ✅ Integrated Git version control support
- ✅ **Automatic formatting** of `.tex` files with `latexindent`
- ✅ **Easy migration** and reproducibility across different machines
- ✅ **VS Code Remote Containers support** for streamlined workflow

## Getting Started

### Step 1: Build the Docker image

Run the following command in your project's root directory to build the Docker image:

```bash
docker build -t texlive:latest .
```

### Step 2: Start the Container in VS Code

- Ensure you have the [VS Code Remote Containers](https://code.visualstudio.com/docs/devcontainers/containers) extension installed.
- Open the project in VS Code.
- Use the VS Code command palette (`Ctrl + Shift + P`) and select:
  ```
  Remote-Containers: Reopen in Container
  ```

VS Code will automatically:
- Run your Docker container.
- Install required extensions.
- Set up Git version control.

## Key Features

- **Automatic formatting** with `latexindent` upon file save.
- **Git integration** directly within the container.
- **Consistent development environment**, ensuring easy migration across systems.

## VS Code Extensions Included

- **LaTeX Workshop**: Provides rich editing, formatting, and compiling tools for LaTeX documents.
- **GitHub Pull Requests**: Seamlessly manage GitHub pull requests within VS Code.
- **GitLens**: Enhanced Git integration for easy code collaboration.