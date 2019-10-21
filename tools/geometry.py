def circumcenter(A: tuple, B:tuple, C:tuple):
    ax = A[0]
    ay = A[1]
    bx = B[0]
    by = B[1]
    cx = C[0]
    cy = C[1]
    d = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
    ux = ((ax * ax + ay * ay) * (by - cy) + (bx * bx + by * by) * (cy - ay) + (cx * cx + cy * cy) * (ay - by)) / d
    uy = ((ax * ax + ay * ay) * (cx - bx) + (bx * bx + by * by) * (ax - cx) + (cx * cx + cy * cy) * (bx - ax)) / d
    return (ux, uy)


if __name__ =='__main__':
    A = (0,0)
    B = (1,1.8)
    C = (2,.3)
    print(circumcenter(A, B, C))