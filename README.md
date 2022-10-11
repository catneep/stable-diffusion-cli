# stable-diffusion-cli
This is a simple Powershell CLI wrapper for stable-diffusion, aimed towards Windows systems.

## Requirements
- Install [Conda](https://docs.conda.io/en/latest/) locally
- Clone and configure [stable-diffusion](https://github.com/CompVis/stable-diffusion) for your system

The script should work with every version of PowerShell greater than 5.1, this being the default for Windows 10 and 11.

## Local parameters
The script depends on variables that contain the location to various files and directories that may vary depending on your system, you can edit them by following these steps:

- Clone this repository with:

        git  clone https://github.com/catneep/stable-diffusion-cli

- Open the `stable-diffusion.ps1` file with a text editor
- Editing the variables under the `# System parameters` comment as follows:

    - **$conda_location**: The parent directory for your local conda installation
    - **$conda_hook**: The location for the `conda-hook.ps1` script within your conda install
    - **$sd_location**: Your local `stable-diffusion-main` directory
    - **$txt_2_img_location**: The location of the `txt2img.py` script used to generate images

You may also set these values to environment variables pointing to the above locations.

## Usage
Syntax:

    stable-diffusion {prompt} {iterations} {width} {height} {dir} -multi -open

Where:

- **prompt**: The prompt used to generate images
- **iterations**: The number of images to generate
- **width/height**: The dimensions of each image
- **dir**: The output directory
- **multi**: Generate multiple images simultaneously
- **open**: Open the containing directory after image generation

Example:

    stable-diffusion "painting of a virus playing the guitar" 5 -dir "D:\User\Pictures" -open

### Notes
- You can also add this project's location to your local PATH variable in order to use it globally
