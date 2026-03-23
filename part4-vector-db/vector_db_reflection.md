## Vector DB Use Case

A traditional keyword-based search would not be sufficient on its own for a law firm searching 500-page contracts with questions like “What are the termination clauses?” Keyword search is useful when the user already knows the exact terms present in the document, but legal language is often paraphrased. One contract may say “termination,” another may say “right to end the agreement,” and another may describe exit conditions without using either phrase directly. A pure keyword system would miss many relevant passages or return too much noise.

A vector database solves this by enabling semantic search. Instead of matching only exact words, the system converts contract chunks and user questions into embeddings. These embeddings capture meaning, so a question about termination can retrieve sections describing cancellation rights, notice periods, breach conditions, or renewal stop clauses even when the exact keyword is absent.

In practice, the contract would be split into manageable chunks, embedded using an NLP model, and stored in a vector database. When a lawyer asks a question, the system embeds the query and retrieves the most semantically similar chunks. Those chunks can then be shown directly or passed into an LLM for answer generation with citations.

So the best design is not keyword search alone, but a hybrid approach: metadata filters and keyword search for precision, combined with a vector database for semantic recall. The vector database is the core retrieval layer that makes natural-language search over long legal documents practical and much more accurate.
