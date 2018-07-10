workflow

===============================

```
make nodes X
```

creates new vagrant nodes

---

make nodes 1
=> creates one node
=> echos ever neccessary info which is needed for a tool to put this node in a cluster or init with this node a cluster

make nodes 2
=> creates two noded
=> echos ever neccessary info which is needed for a tool to put this node in a cluster or init with this node a cluster

===============================

```
make init
```

initilize / creates a new cluster

- ?
    - by IP config or by just passing the configs?


===============================

```
make add node clusterAddress nodeIP
```

adds and inits a new node for/to an existing cluster

===============================

- ?
    - how to handle diff cluster architectures?
        - like make init => inits master node
        - make add master nodeIP cluster
        - make add nodeIP cluster => adds/inits a simple worker node
