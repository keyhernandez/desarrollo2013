package grailsapplication2



import org.junit.*
import grails.test.mixin.*

@TestFor(TDCController)
@Mock(TDC)
class TDCControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/TDC/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.TDCInstanceList.size() == 0
        assert model.TDCInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.TDCInstance != null
    }

    void testSave() {
        controller.save()

        assert model.TDCInstance != null
        assert view == '/TDC/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/TDC/show/1'
        assert controller.flash.message != null
        assert TDC.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/TDC/list'

        populateValidParams(params)
        def TDC = new TDC(params)

        assert TDC.save() != null

        params.id = TDC.id

        def model = controller.show()

        assert model.TDCInstance == TDC
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/TDC/list'

        populateValidParams(params)
        def TDC = new TDC(params)

        assert TDC.save() != null

        params.id = TDC.id

        def model = controller.edit()

        assert model.TDCInstance == TDC
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/TDC/list'

        response.reset()

        populateValidParams(params)
        def TDC = new TDC(params)

        assert TDC.save() != null

        // test invalid parameters in update
        params.id = TDC.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/TDC/edit"
        assert model.TDCInstance != null

        TDC.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/TDC/show/$TDC.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        TDC.clearErrors()

        populateValidParams(params)
        params.id = TDC.id
        params.version = -1
        controller.update()

        assert view == "/TDC/edit"
        assert model.TDCInstance != null
        assert model.TDCInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/TDC/list'

        response.reset()

        populateValidParams(params)
        def TDC = new TDC(params)

        assert TDC.save() != null
        assert TDC.count() == 1

        params.id = TDC.id

        controller.delete()

        assert TDC.count() == 0
        assert TDC.get(TDC.id) == null
        assert response.redirectedUrl == '/TDC/list'
    }
}
