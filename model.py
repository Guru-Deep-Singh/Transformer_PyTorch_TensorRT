import torch
import torch.nn as nn
import math

class InputEmbeddings(nn.Module):
    """
    Converts token indices to dense embedding vectors.

    Maps discrete token indices to continuous vector representations that can be used
    by the transformer model. The embeddings are scaled by the square root of the model dimension.
    """

    def __init__(self, d_model: int, vocab_size: int) -> None:
        """
        Args:
            d_model (int): The dimensionality of the embedding vectors. Paper Attention Is all you need mentions 512
            vocab_size (int): The size of the vocabulary (number of unique tokens).
        """
        super().__init__()
        self.d_model = d_model
        self.vocab_size = vocab_size
        self.embedding = nn.Embedding(vocab_size, d_model)

    def forward(self, x):
        """
        Args:
            x (Tensor): Input tensor of token indices with shape (batch_size, sequence_length).
        Returns:
            Tensor: Embedded representations with shape (batch_size, sequence_length, d_model).
        """
        return self.embedding(x) * math.sqrt(self.d_model)


