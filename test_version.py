pkgs = {
    "torch": "torch",
    "torchvision": "torchvision",
    "torchaudio": "torchaudio",
    "torchtext": "torchtext",
    "datasets": "datasets",
    "tokenizers": "tokenizers",
    "torchmetrics": "torchmetrics",
    "tensorboard": "tensorboard",
    "altair": "altair",
    "wandb": "wandb",
}

print("\n=== PACKAGE VERSION CHECK ===\n")

for name, module in pkgs.items():
    try:
        m = __import__(module)
        version = getattr(m, "__version__", None)
        print(f"{name:12s} : {version}")
    except Exception as e:
        print(f"{name:12s} : ERROR - {e}")

print("\nDone.\n")
