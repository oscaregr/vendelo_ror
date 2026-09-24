require "test_helper"

class ProductControllerTest < ActionDispatch::IntegrationTest
    test "renderisar todo los productos" do
        get products_path

        assert_response :success
        assert_select ".product", 3
    end

    test "renderisar pagina de producto" do
        get product_path(products(:reloj))

        assert_response :success
        assert_select ".title", "Reloj"
        assert_select ".description", "no se mueve"
        assert_select ".price", "13"
    end

    test "renderisa a nuevo producto" do
        get new_product_path

        assert_response :success
        assert_select "form"
    end

    test "permite crear un producto" do
        post products_path, params: {
            product: {
                title: "microhondas",
                description: "no enciende",
                price: 34
            }
        }

        assert_redirected_to products_path
        assert_equal flash[:notice], "producto guardado correctamente correctamente"
    end

    test "no permite crear un producto nuevo con campos vasios" do
        post products_path, params: {
            product: {
                title: "",
                description: "no enciende",
                price: 34,
                category_id: categories(:videogames).id
            }
        }

        assert_response :unprocessable_entity
    end

    test "render a editar producto" do
        get edit_product_path(products(:reloj))

        assert_response :success
        assert_select "form"
    end

    test "permite actualizar un producto" do
        patch product_path(products(:reloj)), params: {
            product: {
                description: "no se mueve"
            }
        }

        assert_redirected_to products_path
        assert_equal flash[:notice], "tu producto se ha actualizado"
    end

    test "eliminar producto" do
        assert_difference("Product.count", -1) do
            delete product_path(products(:reloj))
        end

        assert_redirected_to products_path
        assert_equal flash[:notice], "producto eliminado correctamente correctamente"
    end
end
