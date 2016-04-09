# put-cli
A command line interface for [put.io](https://put.io).

## Installation

### Homebrew
If you use **homebrew**, type the following to install the latest release of **put-cli**.

```bash
brew tap agamagarwal/tap
brew install put-cli
```

Your **put-cli** installation will be automatically updated to the latest release when you run the following:

```bash
brew update
brew upgrade
```

### Directly
If you want to install the latest version directly from the **put-cli** repository, run the following:

```bash
git clone https://github.com/AjayBrahmakshatriya/put-cli.git
cd put-cli
make
make install
```

## Usage

The syntax of every **put-cli** command is as follows:

```bash
put <command> [argument [argument [...]]]
```

The following commands are available currently:

| Command | Description |
| --- | --- |
| `put pwd` | Prints the present working remote directory. |
| `put ls [directory]` | Lists the contents of the given remote directory (or the present working remote directory if not specified). |
| `put cd [directory]` | Changes the present working remote directory to the given remote directory (or the remote root if not specified). |
| `put transfers show` | Lists the existing transfers. |
| `put transfers clear` | Clears the existing transfers list. |
| `put add "<magnet_link>"` | Adds the given the magnet link to transfers. The files are cached to the present working remote directory. |
| `put save [folder/file [folder/file [...]]]` | Downloads all the given remote folders/files to present working system directory. |

## Config

The file `~/.put-cli/put-cli.json` contains the configuration for **put-cli**. The configuration is as follows:

```json
{
	"access_token": "<access-token-here>",
	"downloader": "wget -O $1/$2 \"$3\""
}
```

Insert your access token in the config file to start using **put-cli**.
The default downloader is *wget* but You can configure **put-cli** to use any downloader you want by writing its command in the config.
Make sure that you put `$1`, `$2` and `$3` in the proper place in the downloader command.
Here is what they represent:

| Option | Meaning |
| --- | --- |
| `$1` | Directory where the file is to be downloaded. |
| `$2` | Name of the downloaded file. |
| `$3` | The url of the file to be downloaded. |

For example, if you wish to [aria2](https://aria2.github.io/) as your downloader, use the following option in the config file:

```json
"downloader": "aria2c -x 4 -s 4 -c -d $1 -o $2 \"$3\""
```

## Sugestions?
Please open an issue.
