module ESA

using PyCall: PyNULL, pyimport

export esa
const esa = PyNULL()

function __init__()
    const PIP_PACKAGES = ["esa"]
    sys = pyimport("sys")
    subprocess = pyimport("subprocess")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "--upgrade", PIP_PACKAGES...])
end

end
